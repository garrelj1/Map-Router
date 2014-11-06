//
//  Graph.h
//  MapDrawTest
//
//  Created by Michael Meluso on 11/5/14.
//  Copyright (c) 2014 Michael Meluso. All rights reserved.
//
//  A class that represents an undirected graph
//

#include <iostream>
#include <list>

using namespace std;

class Graph
{
    int V;    // No. of vertices
    list<int> *adj;    // A dynamic array of adjacency lists
public:
    // Constructor and destructor
    Graph()   {adj = new list<int>[V]; }
    ~Graph() { delete [] adj; } // To avoid memory leak
    
    // function to add an edge to graph
    void addEdge(int v, int w);
    
    // Method to check if this graph is Eulerian or not
    int isEulerian();
    
    // Method to check if all non-zero degree vertices are connected
    bool isConnected();
    
    // Function to do DFS starting from v. Used in isConnected();
    void DFSUtil(int v, bool visited[]);

    string toString();
};


