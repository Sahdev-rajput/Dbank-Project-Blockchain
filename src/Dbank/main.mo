import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank{
  stable var currentBalance: Float=200;
  currentBalance :=300;
  Debug.print(debug_show("Value is : ",currentBalance));
  let Value=1213; 
  stable var previousTime=Time.now();


  public func topUp(amount:Float)
  {
    currentBalance+=amount;
  };


  public func topDown(amount:Float)
  {
    if(amount>=currentBalance)
    {
      Debug.print("Cannot Reduce amount");
    }
    else
    {
    currentBalance-=amount;
    }
  };


  public query func checkBalance():async Float
  {
      Debug.print(debug_show(currentBalance));
      return currentBalance;
  };
  // topDown();

  public func compoundInterest()
  {
     var currentTime=Time.now();
     var elapsedTime=currentTime-previousTime;
     currentBalance:=currentBalance*(1.01**Float.fromInt(elapsedTime));
     Debug.print(debug_show(currentBalance));
  }

}
//https://www.appbrewery.co/p/web-development-course-resources