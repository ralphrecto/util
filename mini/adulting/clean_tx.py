#!/usr/local/bin/python
'''
This script helps in cleaning tx data from Personal Capital (PC). Cleaning here
means categorizing Uncategorized tx.

Some notes:
- The actual hard work of integrating with other APIs and normalizing to a
  common format and schema is already done by Personal Capital. We just need to
  enhance it a bit to cover the long tail, which should be worth since it's
  not a ton of effort.
- We presume that actual categorizations made by Personal Capital are correct.
  More work can later be done to perform our own classifications. For the non-large
  amount of effort that I want to spend on this system, this is good enough
  because
    a) the people reponsible for the PC categorizations have way more training
       data than I can hope to get, and
    b) they do this for a living.
'''
import pandas as pd
import sys

# Number of items to show at a time in phase 2.
PHASE_2_BATCH_SIZE = 10

# Set up structures
input_filename = sys.argv[1]
output_filename = sys.argv[2]
raw_tx = pd.read_csv(input_filename)

# Predicates to use for selecting data.
is_uncategorized = lambda df: df.Category == "Uncategorized"
is_seamless = lambda df: df.Description.str.startswith("Seamlss")
is_square = lambda df: df.Description.str.startswith("Sq *")

'''
Phase 1: Heuristics (currently for Seamless and Square transactions)
- Seamless and Square both use a consistent Description prefix e.g. "Seamlsssohothaiformer" and "Sq *baal Falafel"
- All Seamless transactions are food. Most Square transactions are food, and for simplicity we just assume they all are.
'''
raw_tx.loc[is_uncategorized(raw_tx) & (is_seamless(raw_tx) | is_square(raw_tx)), "Category"] = "Restaurants"

'''
Phase 2: Batch updates
We batch update tx in rounds, assuming that by default things are restaurant transactions.
For future use we can make this more generic.
'''

print "============= BEGIN BATCH UPDATES ============="
print "Print indices in space-delimited lines (e.g. 1 31 22)"

phase2_exceptions = []
uncategorized_count = raw_tx.loc[is_uncategorized(raw_tx), :].Amount.count()
num_rounds = (uncategorized_count / PHASE_2_BATCH_SIZE) + 1

for i in range(0, num_rounds):
    floor = i * PHASE_2_BATCH_SIZE
    ceil = floor + PHASE_2_BATCH_SIZE if i < num_rounds - 1 else uncategorized_count - 1
    print(raw_tx.loc[is_uncategorized(raw_tx), ["Description", "Amount"]][floor:ceil])
    raw_round_exceptions = raw_input(">> Non-restaurant indices: ")
    round_exceptions = map(lambda x: int(x), filter(lambda x: len(x) > 0, raw_round_exceptions.split(" ")))
    phase2_exceptions += round_exceptions

raw_tx.loc[is_uncategorized(raw_tx) & ~raw_tx.index.isin(phase2_exceptions)] = "Restaurants"

'''
Phase 3: Individual updates
For the exceptions captured in phase 2, mark the category individually.
'''
categories = [
    "ATM/Cash",
    "Business Miscellaneous",
    "Checks",
    "Clothing/Shoes",
    "Credit Card Payments",
    "Deposits",
    "Education",
    "Electronics",
    "Entertainment",
    "Gasoline/Fuel",
    "General Merchandise",
    "Gifts",
    "Groceries",
    "Healthcare/Medical",
    "Hobbies",
    "Home Improvement",
    "Home Maintenance",
    "Insurance",
    "Interest",
    "Investment Income",
    "Loans",
    "Mortgages",
    "Online Services",
    "Other Income",
    "Paychecks/Salary",
    "Postage & Shipping",
    "Rent",
    "Restaurants",
    "Retirement Contributions",
    "Securities Trades",
    "Service Charges/Fees",
    "Taxes",
    "Transfers",
    "Travel",
    "Utilities",
]

def print_categories():
    print "Categories:"
    for i in range(0, len(categories)):
        print "[%d] %s" % (i, categories[i])

print "============= BEGIN INDIVIDUAL UPDATES ============="

for exception_index in phase2_exceptions:
    print_categories()
    print raw_tx.loc[exception_index, ["Description", "Amount"]]
    chosen_index = int(raw_input(">> Choose category [num]: "))
    raw_tx.loc[exception_index, "Category"] = categories[chosen_index]

pd.to_csv(output_filename)
print "COMPLETE! File written at " + output_filename
