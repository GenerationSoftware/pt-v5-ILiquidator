// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IFlashSwapCallback {
    function flashSwapCallback(
        address _receiver,
        uint256 _amountOut,
        uint256 _amountIn,
        bytes calldata _flashSwapData
    ) external returns (uint256);
}
