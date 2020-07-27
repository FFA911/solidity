pragma experimental SMTChecker;

contract C {
	uint c;
	function add(uint x, uint y) internal returns (uint) {
		c = 0xff;
		if (y == 0)
			return x;
		c = 0xffff;
		if (y == 1)
			return ++x;
		c = 0xffffff;
		if (y == 2)
			return x + 2;
		c = 0xffffffff;
		return x + y;
	}

	function f() public {
		assert(add(100, 0) != 100);
		assert(c != 0xff);
		assert(add(100, 1) != 101);
		assert(c != 0xffff);
		assert(add(100, 2) != 102);
		assert(c != 0xffffff);
		assert(add(100, 100) != 200);
		assert(c != 0xffffffff);
	}
}
// ----
// Warning 6328: (303-329): Assertion violation happens here
// Warning 6328: (333-350): Assertion violation happens here
// Warning 6328: (354-380): Assertion violation happens here
// Warning 6328: (384-403): Assertion violation happens here
// Warning 6328: (407-433): Assertion violation happens here
// Warning 6328: (437-458): Assertion violation happens here
// Warning 6328: (462-490): Assertion violation happens here
// Warning 6328: (494-517): Assertion violation happens here
// Warning 2661: (188-191): Overflow (resulting value larger than 2**256 - 1) happens here
// Warning 2661: (233-238): Overflow (resulting value larger than 2**256 - 1) happens here
// Warning 2661: (267-272): Overflow (resulting value larger than 2**256 - 1) happens here