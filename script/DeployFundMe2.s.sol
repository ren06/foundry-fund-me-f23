// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.18;

import {Script, console} from "../lib/forge-std/src/Script.sol";
import {FundMe2} from "../src/FundMe2.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe2 is Script {

    function deployFundMe() public returns (FundMe2, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig(); // This comes with our mocks!
        address priceFeed = helperConfig.getConfigByChainId(block.chainid).priceFeed;

        vm.startBroadcast();
        FundMe2 fundMe = new FundMe2(priceFeed);
        vm.stopBroadcast();
        return (fundMe, helperConfig);
    }

    function run() external returns (FundMe2, HelperConfig) {
        return deployFundMe();
    }
}
