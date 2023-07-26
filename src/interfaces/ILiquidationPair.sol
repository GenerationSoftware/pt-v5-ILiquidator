// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { SD59x18 } from "prb-math/SD59x18.sol";

interface ILiquidationPair {
  /**
   * @notice Get the address that will receive `tokenIn`.
   * @return Address of the target
   */
  function target() external view returns (address);

  /**
   * @notice Computes the maximum amount of tokens that can be swapped in given the current state of the liquidation pair.
   * @return The maximum amount of tokens that can be swapped in.
   */
  function maxAmountIn() external returns (uint256);

  /**
   * @notice Gets the maximum amount of tokens that can be swapped out from the source.
   * @return The maximum amount of tokens that can be swapped out.
   */
  function maxAmountOut() external returns (uint256);

  /**
   * @notice Swaps the given amount of tokens in and ensures a minimum amount of tokens are received out.
   * @dev The amount of tokens being swapped in must be sent to the target before calling this function.
   * @param _receiver The address to send the tokens to.
   * @param _amountIn The amount of tokens sent in.
   * @param _amountOutMin The minimum amount of tokens to receive out.
   * @return The amount of tokens received out.
   */
  function swapExactAmountIn(
    address _receiver,
    uint256 _amountIn,
    uint256 _amountOutMin
  ) external returns (uint256);

  /**
   * @notice Swaps the given amount of tokens out and ensures the amount of tokens in doesn't exceed the given maximum.
   * @dev The amount of tokens being swapped in must be sent to the target before calling this function.
   * @param _receiver The address to send the tokens to.
   * @param _amountOut The amount of tokens to receive out.
   * @param _amountInMax The maximum amount of tokens to send in.
   * @return The amount of tokens sent in.
   */
  function swapExactAmountOut(
    address _receiver,
    uint256 _amountOut,
    uint256 _amountInMax
  ) external returns (uint256);

  /**
   * @notice Computes the exact amount of tokens to send in for the given amount of tokens to receive out.
   * @param _amountOut The amount of tokens to receive out.
   * @return The amount of tokens to send in.
   */
  function computeExactAmountIn(uint256 _amountOut) external returns (uint256);

  /**
   * @notice Computes the exact amount of tokens to receive out for the given amount of tokens to send in.
   * @param _amountIn The amount of tokens to send in.
   * @return The amount of tokens to receive out.
   */
  function computeExactAmountOut(uint256 _amountIn) external returns (uint256);
}
