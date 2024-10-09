//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns (FundMe) {
        vm.startBroadcast();
        /*   HelperConfig helperConfig = new HelperConfig(); /* this is before vm.broadcast becoz we do not want to spend gas 
         to deploy this on a real chain*/
        // address ethUsdPriceFeed = helperConfig.activeNetworkConfig().priceFeed;  */
        // Removed the declaration of helperConfig
        address ethUsdPriceFeed = 0x694AA1769357215DE4FAC081bf1f309aDC325306;

        //address ethUsdPriceFeed = 0x694AA1769357215DE4FAC081bf1f309aDC325306;
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}
//0x694AA1769357215DE4FAC081bf1f309aDC325306
