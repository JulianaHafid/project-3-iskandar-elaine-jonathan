Braintree::Configuration.environment  = ENV['BRAINTREE_ENV']         || 'sandbox'
Braintree::Configuration.merchant_id   = ENV['BRAINTREE_MERCHANT_ID'] || 'sknvjsqwbp2b7rg5'
Braintree::Configuration.public_key   = ENV['BRAINTREE_PUBLIC_KEY']  || 'tdpnkhkrm7zq7n43'
Braintree::Configuration.private_key  = ENV['BRAINTREE_PRIVATE_KEY'] || '37e51b7c8721387bed8aca0e3cfa7e6d'
