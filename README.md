# README

Use minpay when you're trying to resolve accounts between groups of people - minpay takes a list of all the outstanding payments and combines them so you can resolve your debts with as few payments as possible between individuals.


### How do I calculate payments?

* Download minpay.rb
* Create your transactions.csv file
* Open terminal window, and run ruby minpay.rb -f transactions.csv


### How do I format transactions.csv?

* Each line is a transaction
* Each line can have one debtor, one amount and one or more creditors

If Sue, Bob and Jill went to dinner, and Jill footed the $40 bill, we'd write this as:

```
Jill,40,Jill,Sue,Bob
```