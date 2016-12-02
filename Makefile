default:
	@make cucumber
	@make mechanize

cucumber:
	@source env.example; bundle exec cucumber
