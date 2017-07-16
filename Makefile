#################################################################################
# COMMANDS                                                                      #
#################################################################################

shell:
	docker-compose run --rm hugo /bin/ash

compile:
	docker-compose run --rm -e HUGO_WATCH=false hugo /run.sh