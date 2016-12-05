default:
	@make cucumber
	@make mechanize

cucumber:
	@source env.example; bundle exec cucumber

mechanize:
	@source env.example; mechanize-scripts/redirect-to-govuk-pay.rb

docker-build:
	docker build -t smoke-tests .

# make run - run all the features
# make run FILE=features/cost_determination.feature - run a single feature file
# make run FILE=features/cost_determination.feature:17 - run a single scenario
docker-run:
	@docker run --rm -it -v $$(pwd):/usr/src/app \
		-e PROTOTYPE_URL=https://moj-taxtribs-prototype.herokuapp.com \
		-e FEE_PAYMENT_URL=https://taxtribs-fees-dev.dsd.io \
		-e PROTOTYPE_URL=https://moj-taxtribs-prototype.herokuapp.com \
		-e CASE_WITH_FEE_REF=TC/2016/00042 \
		-e CASE_WITH_FEE_CONF_CODE=RRCYHJ \
		-e CASE_WITH_FEE_TITLE="Mann and Sons" \
		-e CASE_WITH_FEE_AMOUNT="£200" \
	 	digitalronin/cucumber-runner \
		cucumber $${FILE}

