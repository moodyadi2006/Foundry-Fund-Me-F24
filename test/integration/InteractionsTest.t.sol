//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../../src/FundMe.sol";
import {DeployFundMe} from "../../script/DeployFundMe.s.sol";
import {FundFundMe, WithdrawFundMe} from "../../script/Interactions.s.sol";

contract InteractionsTest is Test {
    uint256 number = 1;
    FundMe fundMe;
    address User = makeAddr("User"); //this is only used in foundry(solidity) to make fake addresses
    uint256 constant Gas_Price = 1;

    function setUp() external {
        DeployFundMe deployFundMe = new DeployFundMe();
        fundMe = deployFundMe.run();
        vm.deal(User, 10e18);
    }

    function testUserCanFundInteractions() public {
        // vm.startBroadcast();
        // FundFundMe fundFundMe = new FundFundMe();
        // vm.prank(User);
        // vm.deal(User, 1e18);
        // fundFundMe.fundFundMe(address(fundMe));
        // address funder = fundMe.getFunder(0);
        // assertEq(funder, User);
        // //
        // WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        // withdrawFundMe.withdrawFundMe(address(fundMe));
        // vm.stopBroadcast();
        uint256 preUserBalance = address(User).balance;
        uint256 preOwnerBalance = address(fundMe.getOwner()).balance;

        // Using vm.prank to simulate funding from the User address
        vm.prank(User);
        fundMe.fund{value: 1e18}();

        WithdrawFundMe withdrawFundMe = new WithdrawFundMe();
        withdrawFundMe.withdrawFundMe(address(fundMe));

        uint256 afterUserBalance = address(User).balance;
        uint256 afterOwnerBalance = address(fundMe.getOwner()).balance;

        // assert(address(fundMe).balance == 0);
        // assertEq(afterUserBalance + 1e18, preUserBalance);
        // assertEq(preOwnerBalance + 1e18, afterOwnerBalance);
    }
}
