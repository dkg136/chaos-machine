// This should be run before the Pbinds, it is the calculations that control the actual Pbinds
// This is how we create the chaos.  Manipulate these numbers for different results in the chaos machine

(
//these two chaos arrays control the frqencies
~chaos_array = [ ];
100.do{ //this will iterate 100 times.
	arg i;
	var a, b, c, x, y, z, array; // just creating some random variables
	a = rrand(200, 510); // pick a frequency within this range
	100.do{

		// we can make it more variable by making the randomness larger.
		// take the random number and do some division to create a partial
		b = (a + 500)/(a + 500 + [rrand(1,300), rrand(-300, -1)].choose);
		a = a * b; // create a new frequency
		array = array.add(a); // add it to a temporary array
	};

	c = Pseq(array, 1); // create a sequence of all those frequencies
	~chaos_array = ~chaos_array.add(c); // add all the sequences to the chaos_array
};

~chaos_array2 = [ ];
100.do{ //this will iterate 100 times.
	arg i;
	var a, b, c, x, y, z, array; // just creating some random variables
	a = rrand(100  + (i*2), 610  + (i*2)); // pick a frequency within this range
	100.do{

		// we can make it more variable by making the randomness larger.
		// take the random number and do some division to create a partial
		b = (a + 1000)/(a + 1001 + [rrand(1,100), rrand(-100, -1)].choose);
		a = a * b; // create a new frequency
		array = array.add(a); // add it to a temporary array
	};

	c = Pseq(array, 1); // create a sequence of all those frequencies
	~chaos_array2 = ~chaos_array2.add(c); // add all the sequences to the chaos_array
};

// these two durations calculations create equal durations of 50 beats by summing a bunch of random segments together and then using normalizeSum and multplying by 50 make the durations equal 50.  I needed this for the Ppar so that the different elements stay somewhat in sync.

~durations1 = [ ];
100.do{
	var array, numsegs, my_pseq;
	array = [];
	1.do{
		numsegs = rrand(5,13);
		x = {rrand(1,100)}!numsegs;
		x = x.normalizeSum*50;
		array = x;
	};
	array.postln;
	my_pseq = Pseq(array, 1);
	~durations1 = ~durations1.add(my_pseq);
};

~durations2 = [ ];
100.do{
	var array, numsegs, my_pseq;
	array = [];
	1.do{
		numsegs = rrand(4,6);
		x = {rrand(1,100)}!numsegs;
		x = x.normalizeSum*50;
		array = x;
	};
	array.postln;
	my_pseq = Pseq(array, 1);
	~durations2 = ~durations2.add(my_pseq);
};
)

// let's check to make sure it worked.
~chaos_array;
~chaos_array[0];
~durations1;