// This example code is designed to quickly deploy an example contract using Remix.

pragma solidity ^0.6.7;

//import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
//import "https://github.com/smartcontractkit/chainlink/blob/5dbbc21f13fa00ee724c439273156834c45ab93e/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";


contract Assign {

    AggregatorV3Interface internal priceFeed;
    int[] private arr; 


    /**
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     */
    constructor() public {
        priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    }

event PriceFeed(address indexed _from,int _price);
    /**
     * Returns the latest price
     */
    function getLatestPrice() public payable returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
          arr.push(price);// every method call current price will be pushed into an array
      emit PriceFeed(msg.sender,price);
        return price;
    }
    
    /**
     * function to get average price from array values
     */
    
    function getAvg() public view returns(int){
                 uint i;
                 int sum= 0;
                 int avg=0;
                    for(i = 0; i < arr.length; i++)
                         sum = sum + arr[i];
                    
                    avg=sum/int256(arr.length);
                     return avg;
            }
    
   
}