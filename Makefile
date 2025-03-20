.PHONY: nixosRebuild homeManager

nixosRebuild:
	@sudo $$(cat .env) nixos-rebuild switch --impure --flake .\#$(HOST)

homeManager:
	@export USER=$(USER)
	@home-manager switch --flake .\#$(USER) -b hm-backup
