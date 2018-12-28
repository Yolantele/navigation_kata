## Navigation Robots:

A ruby prototype to solving robot navigation proglem. 
Ruby was chosen for rapid protoyping capacity and the object-oriented nature of the kata itself.

Solution:

  Navigator:

  1. sets the robot on grid - the starting location and sequence of navigation instructions
  2. converts grid coordinates to array coordinates (nested arrays)
  3. executes each navigational step
  4. converts array coordinates back into grid coordinates
  5. iterates each robot navigational instructions 


    Next Steps:

    1. improve report on lost robots
    2. solve navigation bug on one of the robots.
    3. extract classes for grid and rules to feed in custom rules of the game

Instructions to run application:

  1. clone this repo:
  ```
  git clone https://github.com/Yolantele/navigation_kata
  ```
  
  2. change directory to ```navigation_kata```: 

  ```
  cd navigation_kata
  ```

  3. Install dependencies:

  ```
  bundle install
  ```

  4. run tests: 
  ```
  rspec
  ```

  5. open irb or pry console. In your console

  ```
  require './lib/navigator.rb'
  ```

  6. create new navigator, which will load the tested rovers and the grid

  ```
  navigator = Navigator.new
  ```

  7. lastly, run the encapsulate method - rovers_report on navigator to see the final coordinates Reports

  ```
  navigator.rovers_report
  ```




Rules of the kata:

> A robot position consists of:
- a grid coordinate, a pair of integers: 
    x
    y 
- an orientation:
    N - north
    S - south
    E - east
    W - west


> A robot instruction* is a string of:

● “L” - Left : turns left 90 degrees

● “R” - Right : turns right 90 degrees

● “F” - Forward : moves forward one grid point

* - additional command types may be required in the future, please provision


> The rectangula grid : 
- the robot that moves “off” an edge of the grid leave a robot “scent” at the last grid position. - An instruction to move     “off” the world from a grid point from which a robot has been previously lost is simply ignored by the current robot.
- grid size is 5x3
- the lower-left coordinates are assumed to be 0, 0

> The  Input 
- The first line is starting position 
- The remaining input are the navigation instructions. 
- instruction strings less than 100 characters in length.


> The  Output 
- the output should indicate the final grid position and orientation of the robot. 
- If a robot falls off the edge of the grid the word “LOST” should be printed after the position and orientation.


> Sample  Input:

a)
```
5 3 - upper right grid world coordinates
```

```
1 1 E
RFRFRFRF
```

b)
```
3 2 N
FRRFLLFFRRFLL
```

c)
```
0 3 W
LLFFFLFLFL
```


> Sample  Output

a)
```
1 1 E
```

b)
```
3 3 N LOST
```

c)
```
2 3 S
```
