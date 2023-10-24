// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ILiquidationPair } from "./ILiquidationPair.sol";
import { IFlashSwapCallback } from "./IFlashSwapCallback.sol";

interface ILiquidationRouter is IFlashSwapCallback {
    /**
     * @notice Swaps the given amount of output tokens for at most input tokens.
     * @dev Only callable by the trusted LiquidationPairs retrieved from the LiquidationPairFactory set at deployment.
     * @param liquidationPair The pair to swap against
     * @param receiver The account to receive the output tokens
     * @param amountOut The exact amount of output tokens expected
     * @param amountInMax The maximum of input tokens to spend
     * @param deadline The timestamp that the swap must be completed by
     * @return The actual number of input tokens used
     */
    function swapExactAmountOut(
        ILiquidationPair liquidationPair,
        address receiver,
        uint256 amountOut,
        uint256 amountInMax,
        uint256 deadline
    ) external returns (uint256);
}
