#!/usr/bin/env ruby

require 'bundler/setup'
require 'mechanize'

# Test that searching for a case with an outstanding fee and then clicking 'Pay now'
# results in a credit card payment form being shown to the user.

def main
  puts "Testing redirection to payment form..."

  a = Mechanize.new

  a.get(ENV.fetch('FEE_PAYMENT_URL')) do |page|
    search_page  = a.click(page.link_with(text: /Start now/))
    results_page = search_for_case(search_page, ENV.fetch('CASE_WITH_FEE_REF'), ENV.fetch('CASE_WITH_FEE_CONF_CODE'))
    payment_page = click_link(a, results_page, 'Pay now')

    test_payment_form payment_page
  end

  puts_green "    Passed."
end

def search_for_case(page, case_reference, confirmation_code)
  page.form_with(action: '/case_requests') do |f|
    set_field(f, 'case_request[case_reference]', ENV.fetch('CASE_WITH_FEE_REF'))
    set_field(f, 'case_request[confirmation_code]', ENV.fetch('CASE_WITH_FEE_CONF_CODE'))
  end.click_button
end

def click_link(a, page, link_text)
  link = page.links.find {|l| l.text == link_text}
  a.click link
end

def test_payment_form(page)
  page.form_with(action: '/card_details') do |f|
    field_names = f.fields.map(&:name)
    %w(cardNo expiryMonth cvc).map {|name|
      raise("Missing field #{name} in credit card payment details form") unless field_names.include?(name)
    }
  end
end

def set_field(f, field_name, value)
  field = f.fields.find {|fld| fld.name == field_name}
  field.value = value
end

def puts_red(string)
  puts "\033[0;31m#{string}\033[0m"
end

def puts_green(string)
  puts "\033[0;32m#{string}\033[0m"
end

main
