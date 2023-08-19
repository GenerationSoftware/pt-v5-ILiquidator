// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./ILiquidationPair.sol";

/// @notice Interface for the flash swap callback
interface IFlashSwapCallback {

    /// @notice Called on the token receiver by the LiquidationSource during a liquidation if the flashSwap data length is non-zero
    /// @param _pair The LiquidationPair that was called
    /// @param _sender The address that triggered the liquidation swap
    /// @param _amountOut The amount of tokens that were sent to the receiver
    /// @param _amountIn The amount of tokens expected to be sent to the target
    /// @param _flashSwapData The flash swap data that was passed into the swap function
    function flashSwapCallback(
        ILiquidationPair _pair,
        address _sender,
        uint256 _amountOut,
        uint256 _amountIn,
        bytes calldata _flashSwapData
    ) external returns (uint256);
}
