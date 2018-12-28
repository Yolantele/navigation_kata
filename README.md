## Navigation Robots:

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