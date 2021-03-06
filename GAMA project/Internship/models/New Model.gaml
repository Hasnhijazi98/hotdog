/**
* Name: NewModel
* Based on the internal empty template. 
* Author: Hassan Lapt
* Tags: 
*/

model Elysee

global{
	predicate people_near <- new_predicate("people near");
	predicate car_near<-new_predicate("car near");
	predicate wait <- new_predicate("wait");
	predicate change_direction <- new_predicate("change_direction");
	image_file icon <- image_file("C:/Users/Hassan Lapt/Desktop/Gamma/ambulance.png");
	file roads <- file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/footway.shp");
	file highway <- file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/main_street2.shp");
	file buildings <- file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/polygons.shp");
	file f1 ;
	int locating_radius <-70;
	matrix matrix1 ;
	
	string people1;
	string people2;
	string people3;
	string people4;
	string people5;
	string people6;
	string people7;
	string distances1;
	string distances2;
	string distances3;
	string distances4;
	string distances5;
	string distances6;
	string distances7;
	string distances;
	geometry shape <- envelope(roads);
	graph g1;
	graph g2; 
	point p1 <- {535,290};
	point p2 <-{355,219};
	point p3 <-{168,130};
	point ambulance_position <-{630,330};
	point p4 <-{34,63};
	point p5<-{121,63};
	point p6<-{253,130};
	point p7<-{448,226};
	point ambulance_pos<- nil;
	int people_nb<-25;
	init{
		
		create pole1 {
			location<-p1;
		}
		create pole2 {
			location<-p2;
		}
		create pole3 {
			location<-p3;
		}
		create pole4 {
			location<-p4;
		}
		create pole5 {
			location<-p5;
		}
		create pole6 {
			location<-p6;
		}
		create pole7 {
			location<-p7;
		}
		create polygons from: buildings;
		create road from: roads;
		
		create main_street from: highway;
		create people number: people_nb{
			location <- any_location_in(one_of(polygons));
			speed<-rnd(0.3,0.9);
		}
		create cars number: 5 {
			location <- any_location_in(one_of(main_street));
			heading<-120.0;
			speed<-rnd(2.0,3.0);
		}
		create ambulance {
			location<-ambulance_position;
			speed<-3.5;
		}
		g1 <- as_edge_graph(road);
		g2 <- as_edge_graph(highway); 
	}
}

species pole1 control:simple_bdi{
	list<people> people_near;
	aspect base{
		draw circle(5) color: #red;
	}
	
	reflex save_distance{
		if every(20#cycle){
			save distance_to(p1,ambulance_position) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole1.csv" type:"csv" ;
			f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole1.csv");
			matrix1 <-matrix(f1);
			if distances1 != nil{
				distances1<-distances1+string(matrix1);
			}
			else{
				distances1<-string(matrix1);
			}
			save distances1 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole1.csv" type:"csv" ;
		}
	}
	perceive target:people in:locating_radius{
			focus id:"people at pos" var:location;
	}
	reflex save_world{
		if every(20#cycle){
		people_near <-people at_distance(locating_radius);
		save length(people_near) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people1.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people1.csv");
		matrix1 <-matrix(f1);
		if people1 != nil{
			people1<-people1+string(matrix1);
		}
		else{
			people1<-string(matrix1);
		}
		save people1 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people1.csv" type:"csv" ;
	}}
	
}



species pole2{
	list<people> people_near;
	aspect base{
		draw circle(5) color: #red;
	}
	
	reflex save_distance{
		if every(20#cycle){
		save distance_to(p2,ambulance_position) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole2.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole2.csv");
		matrix1 <-matrix(f1);
		if distances2 != nil{
			distances2<-distances2+string(matrix1);
		}
		else{
			distances2<-string(matrix1);
		}
		save distances2 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole2.csv" type:"csv" ;
	}}
	perceive target:people in:locating_radius{
			focus id:"people at pos" var:location;
	}
	reflex save_world{
		if every(20#cycle){
		people_near <-people at_distance(locating_radius);
		save length(people_near) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people2.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people2.csv");
		matrix1 <-matrix(f1);
		if people2 != nil{
			people2<-people2+string(matrix1);
		}
		else{
			people2<-string(matrix1);
		}
		save people2 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people2.csv" type:"csv" ;
	}}
	/* 	if (!empty(people_near)){
		write people_near[0].location;
	}else{write "empty";}
	*/
	}
	
	


species pole3{
	list<people> people_near;
	aspect base{
		draw circle(5) color: #red;
	}
	reflex save_distance{
		if every(20#cycle){
		save distance_to(p3,ambulance_position) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole3.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole3.csv");
		matrix1 <-matrix(f1);
		if distances3 != nil{
			distances3<-distances3+string(matrix1);
		}
		else{
			distances3<-string(matrix1);
		}
		save distances3 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole3.csv" type:"csv" ;
	}
	
	}
	perceive target:people in:locating_radius{
			focus id:"people at pos" var:location;
	}
	reflex save_world{
		if every(20#cycle){
		people_near <-people at_distance(locating_radius);
		save length(people_near) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people3.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people3.csv");
		matrix1 <-matrix(f1);
		if people3 != nil{
			people3<-people3+string(matrix1);
		}
		else{
			people3<-string(matrix1);
		}
		save people3 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people3.csv" type:"csv" ;
	}}
}

species pole4{
	list<people> people_near;
	aspect base{
		draw circle(5) color: #red;
	}
	reflex save_distance{
		if every(20#cycle){
		save distance_to(p4,ambulance_position) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole4.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole4.csv");
		matrix1 <-matrix(f1);
		if distances4 != nil{
			distances4<-distances4+string(matrix1);
		}
		else{
			distances4<-string(matrix1);
		}
		save distances4 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole4.csv" type:"csv" ;
	}
	
	}
	perceive target:people in:locating_radius{
			focus id:"people at pos" var:location;
	}
	reflex save_world{
		if every(20#cycle){
		people_near <-people at_distance(locating_radius);
		save length(people_near) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people4.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people4.csv");
		matrix1 <-matrix(f1);
		if people4 != nil{
			people4<-people4+string(matrix1);
		}
		else{
			people4<-string(matrix1);
		}
		save people4 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people4.csv" type:"csv" ;
	}}
}

species pole5{
	list<people> people_near;
	aspect base{
		draw circle(5) color: #red;
	}
	reflex save_distance{
		if every(20#cycle){
		save distance_to(p5,ambulance_position) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole5.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole5.csv");
		matrix1 <-matrix(f1);
		if distances5 != nil{
			distances5<-distances5+string(matrix1);
		}
		else{
			distances5<-string(matrix1);
		}
		save distances5 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole5.csv" type:"csv" ;
	}
	
	}
	perceive target:people in:locating_radius{
			focus id:"people at pos" var:location;
	}
	reflex save_world{
		if every(20#cycle){
		people_near <-people at_distance(locating_radius);
		save length(people_near) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people5.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people5.csv");
		matrix1 <-matrix(f1);
		if people5 != nil{
			people5<-people5+string(matrix1);
		}
		else{
			people5<-string(matrix1);
		}
		save people5 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people5.csv" type:"csv" ;
	}}
}

species pole6{
	list<people> people_near;
	aspect base{
		draw circle(5) color: #red;
	}
	reflex save_distance{
		if every(20#cycle){
		save distance_to(p6,ambulance_position) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole6.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole6.csv");
		matrix1 <-matrix(f1);
		if distances6 != nil{
			distances6<-distances6+string(matrix1);
		}
		else{
			distances6<-string(matrix1);
		}
		save distances6 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole6.csv" type:"csv" ;
	}
	
	}
	perceive target:people in:locating_radius{
			focus id:"people at pos" var:location;
	}
	reflex save_world{
		if every(20#cycle){
		people_near <-people at_distance(locating_radius);
		save length(people_near) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people6.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people6.csv");
		matrix1 <-matrix(f1);
		if people6 != nil{
			people6<-people6+string(matrix1);
		}
		else{
			people6<-string(matrix1);
		}
		save people6 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people6.csv" type:"csv" ;
	}}
}

species pole7{
	list<people> people_near;
	aspect base{
		draw circle(5) color: #red;
	}
	reflex save_distance{
		if every(20#cycle){
		save distance_to(p7,ambulance_position) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole7.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole7.csv");
		matrix1 <-matrix(f1);
		if distances7 != nil{
			distances7<-distances7+string(matrix1);
		}
		else{
			distances7<-string(matrix1);
		}
		save distances7 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/pole7.csv" type:"csv" ;
	}
	
	}
	perceive target:people in:locating_radius{
			focus id:"people at pos" var:location;
	}
	reflex save_world{
		if every(20#cycle){
		people_near <-people at_distance(locating_radius);
		save length(people_near) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people7.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people7.csv");
		matrix1 <-matrix(f1);
		if people7 != nil{
			people7<-people7+string(matrix1);
		}
		else{
			people7<-string(matrix1);
		}
		save people7 to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/people7.csv" type:"csv" ;
	}}
}

species people skills:[moving] control:simple_bdi{
		aspect base{
			draw circle(4) color: #yellow ;
		}
		
		init{
			do add_desire(people_near);
		}
		perceive target:people in:20{
			focus id:"people at pos" var:location;
			ask myself{
				do remove_intention(people_near,false);
			}
		}
		perceive target:cars in:50{
			focus id:"cars at pos" var:location;
			ask myself{
				do remove_intention(car_near,false);
			}
		}
		rule belief:people_near new_desire:change_direction strength:1.0;
		rule belief:car_near new_desire:wait strength:2.0;
		
		plan lets_move intention: people_near{
			do wander on:g1;
		}
	//	reflex write2 {
	// 		list<point> car_nearby <- get_beliefs_with_name("cars at pos") collect (point(get_predicate(mental_state (each)).values["location_value"]));
	// 		if(empty(car_nearby)){
	// 			speed<-1.0;
	// 		}
	// 	}
	// 	reflex write {
	// 		list<point> car_nearby2 <- get_beliefs_with_name("cars at pos") collect (point(get_predicate(mental_state (each)).values["location_value"]));
	// 		if(!empty(car_nearby2)){
	// 			speed<-0.0;
	// 		}
	// 	}
	 	
	/*	plan car_near intention: wait{
			list<point> car_nearby <- get_beliefs_with_name("car_near") collect (point(get_predicate(mental_state (each)).values["location_value"]));
			write car_nearby;
			write "a";
			if (!empty(car_nearby)){
				speed<-0.0;
			}
			else{
				speed<-1.0;
			}
		} */
}


species road {
	aspect base{
		draw shape color: #black;
	}
}

species main_street {
	aspect base{
		draw shape color: #grey;
	}
}

species polygons {
	aspect base{
		draw shape color: #lightblue;
	}
}

species ambulance skills:[moving]{
	point target<-{17,34};
	reflex move {
		do goto target:target on: g2;
	}
	
	reflex update_pos {
		ambulance_pos<- self.location;
		ambulance_position<-ambulance_pos;
	}
		aspect base{
			draw icon size:20 ;
		}
	reflex save_distance{
		if every(20#cycle){
		save min([distance_to(p1,ambulance_position),distance_to(p2,ambulance_position),distance_to(p3,ambulance_position),distance_to({34,63},ambulance_position),distance_to(p5,ambulance_position),distance_to(p6,ambulance_position),distance_to(p7,ambulance_position)]) to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/ambulance.csv" type:"csv" ;
		f1 <- csv_file("C:/Users/Hassan Lapt/Desktop/Gamma/elysée/ambulance.csv");
		matrix1 <-matrix(f1);
		if distances != nil{
			distances<-distances+string(matrix1);
		}
		else{
			distances<-string(matrix1);
		}
		save distances to:"C:/Users/Hassan Lapt/Desktop/Gamma/elysée/ambulance.csv" type:"csv" ;
	}
	
	}
}

species cars skills:[moving]{
	reflex move {
		do wander on: g2;
	}
		aspect base{
			draw circle(5) color: #blue ;
		}
}

experiment Elysee type:gui{
	output{
	 	monitor "ambulance position" value:ambulance_position ;	
		monitor "distance from pole 1" value:distance_to(p1,ambulance_position);
		monitor "distance from pole 2" value:distance_to(p2,ambulance_position);
		monitor "distance from pole 3" value:distance_to(p3,ambulance_position);
		monitor "distance from pole 4" value:distance_to(p4,ambulance_position);
		monitor "distance from pole 5" value:distance_to(p5,ambulance_position);
		monitor "distance from pole 6" value:distance_to(p6,ambulance_position);
		monitor "distance from pole 7" value:distance_to(p7,ambulance_position);
		monitor "minimal distance" value:min([distance_to(p1,ambulance_position),distance_to(p2,ambulance_position),distance_to(p3,ambulance_position),distance_to({34,63},ambulance_position),distance_to(p5,ambulance_position),distance_to(p6,ambulance_position),distance_to(p7,ambulance_position)]) ;
		display map{
			species pole1 aspect:base;
			species pole2 aspect:base;
			species pole3 aspect:base;
			species pole4 aspect:base;
			species pole5 aspect:base;
			species pole6 aspect:base;
			species pole7 aspect:base;
			
			species road aspect:base;
			species polygons aspect:base;
			species main_street aspect:base;
			species people aspect:base;
			species ambulance aspect:base;
			species cars aspect:base;
		}
	}
}

/* Insert your model definition here */

