-include .env
build:; forge build
deploy-sepolia:; forge script script/DeployFundMe2.s.sol:DeployFundMe2 --broadcast --rpc-url $(SEPOLIA_RPC_URL) --private-key $(SEPOLIA_PRIVATE_KEY)