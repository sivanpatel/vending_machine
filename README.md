# Vending Machine

## Brief

This is a simulation of a vending machine, using the following rules:
  - Once an item is selected and the appropriate amount of money is inserted, the vending machine should return the correct product.
  - It should also return change if too much money is provided, or ask for more money if insufficient funds have been inserted.
  - The machine should take an initial load of products and change. The change will be of denominations 1p, 2p, 5p, 10p, 20p, 50p, £1, £2.
  - There should be a way of reloading either products or change at a later point.
  - The machine should keep track of the products and change that it contains.

## To run

To run the program, use the following commands:
```
bundle install
ruby start_vending_machine.rb
```
If pressing the enter button returns the character `^M`, exit the program with `Ctrl-C`, and then run the command `stty sane` in the command line.

To run the tests, in the root directory run the command: `rspec`

### File Structure
```
├── Gemfile
├── Gemfile.lock
├── README.md
├── lib
│   ├── money
│   │   ├── bank.rb
│   │   ├── coin.rb
│   │   ├── converter.rb
│   │   └── transaction.rb
│   ├── product.rb
│   ├── stock.rb
│   ├── vending_machine.rb
│   └── vending_machine_controller.rb
├── spec
│   ├── money
│   │   ├── bank_spec.rb
│   │   ├── coin_spec.rb
│   │   ├── converter_spec.rb
│   │   └── transaction_spec.rb
│   ├── product_spec.rb
│   ├── spec_helper.rb
│   ├── stock_spec.rb
│   ├── vending_machine_controller_spec.rb
│   └── vending_machine_spec.rb
└── start_vending_machine.rb
```


