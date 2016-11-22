default:
	@make cucumber
	@make mechanize

cucumber:
	@source env.example; bundle exec cucumber

mechanize:
	@source env.example; mechanize-scripts/redirect-to-govuk-pay.rb
