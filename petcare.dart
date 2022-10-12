import 'dart:io';

class PetCare {
	int food = 0;
	int water = 0;
	int gift = 0;
	bool happy = false;
	String name = "";

	PetCare(this.name);

	@override
	String toString() => "---- $name Stats -----\nFood : $food/5\nWater : $water/5\nGift : $gift/5\n--------------------";


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
	var mascota = PetCare("anonymous");
	bool play = true;

	while (play) {
		print("----- PetCare MiniGame -----\n[1] : Enter Pet Name\n[2] : Give some water\n[3] : Give some food\n[4] : Check stats\n[5] : Exit");
		int? choose = int.parse(stdin.readLineSync()!);

		if (choose == 1) {
			print("What's your pet name? : ");
			String? name = stdin.readLineSync();
			mascota = PetCare("$name");

		}

		else if (choose == 2) {
			mascota.giveWater();
		}

		else if (choose == 3){
			mascota.giveFood();
		}

		else if (choose == 4){
			print(mascota);
		}

		else {
			play = false;
		}

	}
	
}
