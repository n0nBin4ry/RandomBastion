/********************************************************************************************

- Private method used by obj_level constructor

- Is called when the current grid position for a floor tile is in the outer border so that
  the we can keep a 1-cell border for a wall.

- Takes 3 args: borderNewDirection(int cdir, int c_x, int c_y) where cdir gives us the 
  current direction cells are being instatiated, c_x is current grid column postion, and
  c_y is the current grid row position.
  - Uses these three args to move back to previous cell and find new direction not towards
    border.
	

********************************************************************************************/
//if (cdir == 0 && c_x)

// NVM, using clamp()