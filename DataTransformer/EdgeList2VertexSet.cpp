#include <bits/stdc++.h>
using namespace std;
vector<string> split(string str, char delimiter){
	vector<string> internal;
	stringstream ss(str);
	string temp;
	while (getline(ss, temp, delimiter)){
		internal.push_back(temp);
	}
	return internal;
}


int main(int argc,char *argv[]){
    std::ios_base::sync_with_stdio(false);

    if(argc <= 2) {
        std::cerr << "Error: input parameter less than 2!" << std::endl;
        return -1;
    }
    string inputFile = argv[1];
    string outputFile = argv[2];

    ifstream graphFile(inputFile.c_str());
    if(!graphFile.is_open()){
        std::cerr << "error: Input File Open Failed!" << std::endl;
        return -1;
    }

    ofstream resultFile(outputFile.c_str());
    if(!graphFile.is_open()){
        std::cerr << "error: Output File Open Failed!" << std::endl;
        return -1;
    }

    int vid,eid;
    map<int,vector<int> > vertexSet;
    cout<<"Loading data"<<endl;
    while(graphFile>>vid>>eid){
        if(vertexSet.find(eid) == vertexSet.end()){
            vertexSet[eid] = vector<int>();
        }
        vertexSet[eid].push_back(vid);
    }

    cout<<"Saving data"<<endl; 
    for(const auto& part : vertexSet){
        for(int i = 0; i < part.second.size(); i++){
            if(i != 0) 
                resultFile << " ";
            resultFile << part.second[i];
        }
        resultFile << "\n";
    }

    return 0;
}