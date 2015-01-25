require 'ledgerous'
require 'csv'

def file_path
  return ARGV[0] if ARGV[0]
  'transactions.csv'
end

def transactions
  CSV.foreach(file_path) do |row|
    debtor = row[0]
    creditors = row.drop(2)
    amount = row[1].to_i / creditors.length
    creditors.each do |creditor|
      yield Transaction.new(debtor, creditor, amount)
    end
  end
end

def print_transaction(t)
  puts t.creditor.to_s + ' owes ' + t.debtor.to_s + ' $' + t.amount.to_s
end

accounts = Ledgerous.new
transactions { |t| accounts.reconcile(t) }
accounts.settle.each { |t| print_transaction(t) }
