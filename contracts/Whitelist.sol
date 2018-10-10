pragma solidity ^0.4.23;

contract Whitelist {


  address admin;

  //constructor function to initialize contract
  constructor() public{

      //assign contract creator as admin for this contract. 
      admin = msg.sender;
  }

  struct Product{
      bytes32 id;
      uint256 price;
      address owner;
  }

  Product[] public products; 
  mapping(address => bool) public whiteListAddresses;

  mapping (bytes32 => Product) public ProductToProductID;


  //This is implement to show that this can be done with this modifier approach
   modifier onlyAllowedSeller() {
        if (!whiteListAddresses[msg.sender]) {
            revert();
        }
        _;
    }

  function whiteListAddress(address buyer) public{
    //A modifier is also can be written instead inside function check
    if (msg.sender != admin) return;

    //enable that the buyer is listed for adding products
    whiteListAddresses[buyer] = true;
  }


  //add product in the array structure and store _id for mapping for its retrival 
  function addProduct(bytes32 _id, uint256 _price) public onlyAllowedSeller{
       
        Product memory product = Product(
            _id,
            _price,
            msg.sender
        );
        products.push(product);

        ProductToProductID[_id] = product;
  }

  //If buyer sends equal amount of product.price then money will be transfer to seller and product ownership is changed
  function buyProduct(bytes32 _id) public payable{
        require(msg.sender != 0);  //check for null address
        Product storage product = ProductToProductID[_id];
        require(msg.sender != product.owner);
        require(msg.value == product.price);
        product.owner.transfer(msg.value);
        product.owner = msg.sender; 
  }

//lists the count of products available on the system
  function getProductCount() public view returns(uint256){
    return products.length;
  }

  //Verifies current ownership of the product
  function productOwnerCheck(address _from, bytes32 _id) public view returns(bool){
        Product storage product = ProductToProductID[_id];
        if (product.owner == _from){
            return true;
        }else {
            return false;
        }
  }

}