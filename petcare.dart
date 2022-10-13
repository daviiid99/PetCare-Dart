import 'dart:io';
import 'dart:math';


abstract class Animal{
	factory Animal(String animal){
		if (animal == "perro") return Perro("guau");
		if (animal == "gato") return Gato("miau");
		throw 'Can\'t create $animal.';
	}

	String get saludo;
}

class Perro implements Animal {
	final String animal;
	Perro(this.animal);
	String get saludo => "guau";

}

class Gato implements Animal {
	final String animal;
	Gato(this.animal);
	String get saludo => "miau";
}

class PetCare {
	int food = 0;
	int water = 0;
	int gift = 0;
	bool happy = false;
	String name = "none";
	int age = 0;
	String get petName => this.name;
	String animal = "";


	PetCare({this.age = 0, this.name = "Pepe", this.animal = ""});

	@override
	String toString() => "---- $name Stats -----\nAge : $age\nFood : $food/5\nWater : $water/5\nGift : $gift/5\n--------------------";


	void giveWater(){
		if (this.water <= 4){
			this.water +=1;

		} else {
			print("\nYour $name don't need more water ^-^U");
		}
	}

	void giveFood(){
		if (this.food <= 4){
			this.food +=1;

		} else {
			print("\nYour $name don't need more food ^-^U");
		}
	}



}

void main(List<String> args){
	var mascota = PetCare();
	var currentPet = PetCare();
	List<PetCare> pets = [];
	bool play = true;
	bool create = true;
	String? name = "";
	int? age = 0;
	String? animal = "";
	final gato = Animal("gato");
	final perro = Animal("perro");

	while (play) {
		print("----- PetCare MiniGame -----\n[1] : Manage Pets\n[2] : Give some water\n[3] : Give some food\n[4] : Check stats\n[5] : Exit\n----------------------------\n");
		int? choose = int.parse(stdin.readLineSync()!);

		if (choose == 1){
			create = true;

			while (create){

				print("\n[1] : Create new pet\n[2] : Show all pets\n[3] : Set current pet\n[4] : Return\n");
				int? user = int.parse(stdin.readLineSync()!);

				if (user == 1){

					print("What's your pet name? : ");
					String? name = stdin.readLineSync();

					print("What's your pet age? : ");
					int? age = int.parse(stdin.readLineSync()!);

					print("What's your animal? (Gato|Perro) : ");
					String? animal = stdin.readLineSync();

					mascota = PetCare(name : "$name", age : age, animal : "$animal");
					pets.add(mascota);

					if (animal == "Gato"){
						print(gato.saludo);
					}

					else {
						print(perro.saludo);

					}
					

					}

				else if (user == 2){
					for (int i = 0; i < pets.length; i++){
						print(pets[i]);
					}
				}

				else if (user == 3){
					print("\nEnter your pet name : ");
					String? name = stdin.readLineSync();


					for (int i = 0; i < pets.length; i++){
						if (pets.elementAt(i).petName == name){
							currentPet = pets.elementAt(i);
						}
						}
						
				}

				else {
					create = false;

				}	
			}
				
		}


		else if (choose == 2) {
			currentPet.giveWater();
		}

		else if (choose == 3){
			currentPet.giveFood();
		}

		else if (choose == 4){
			print(currentPet);
		}

		else {
			play = false;
		}

	}
	
}
