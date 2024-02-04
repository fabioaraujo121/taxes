# Tax Calculation

### Introduction
This is a simple tax calculation program. It takes the user's input and calculates the tax based on the user's input.

### Rules
Basic sales tax is applicable at a rate of 10% on all goods, except books, food, and medical products that are exempt. Import duty is an additional sales tax applicable on all imported goods at a rate of 5%, with no exemptions.

When I purchase items I receive a receipt which lists the name of all the items and their price (including tax), finishing with the total cost of the items, and the total amounts of sales taxes paid. The rounding rules for sales tax are that for a tax rate of n%, a shelf price of p contains (np/100 rounded up to the nearest 0.05) amount of sales tax.

### Assumptions
1. The input is always correct (see below).
2. The categorization only handles books, food, and medical products defined in `./lib/models/concerns/categorize.rb`.
3. The imported products always have an `imported` word in the description.

## How To

This app uses *Ruby 3.0.0*. You can use the following command to run the app:

```bash
ruby main.rb
```

### Input
You already have one example in `./data/input.txt`.
It only accepts one entrance/purchase (with many products) per time. Here's an example:

```txt
1 imported bottle of perfume at 27.99
1 bottle of perfume at 18.99
1 packet of headache pills at 9.75
3 imported boxes of chocolates at 11.25
```
