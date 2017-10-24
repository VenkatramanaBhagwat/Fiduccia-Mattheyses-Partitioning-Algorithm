#include <string>
class Cell{
public:
	std::string Id; //cell id
	int partition;// partition in which the cell is present
	bool locked;//cell locked or not
	int gain;// gain of the cell
	int area;// area of the cell
	std::vector<int> netList;
	//set cell lock status
	bool getLockStatus(){
		return locked;
	}
	//set cell lock status between true and false
	void setLockStatus(bool status){
		locked=status;
	}
	//toggle partition from 1 to 0
	void togglePartition(){
		partition=partition^1;
	}
};
