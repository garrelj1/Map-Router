//
//  Graph.cpp
//  MapDrawTest
//
//  Created by Michael Meluso on 11/5/14.
//  Copyright (c) 2014 Michael Meluso. All rights reserved.
//  Modified from http://www.geeksforgeeks.org/eulerian-path-and-circuit/
//

// A C++ class to represent a graph and test if it is Eulerian or not
#include <list>
#include <string>
#include <iostream>
#include <sstream>

using namespace std;

class Graph
{
    int V;              // No. of vertices
    list<int> *adj;    // A dynamic array of adjacency lists

    void addEdge(int v, int w)
    {
        adj[v].push_back(w);
        adj[w].push_back(v);  // Note: the graph is undirected
        V++;
    }

    void DFSUtil(int v, bool visited[])
    {
        // Mark the current node as visited and print it
        visited[v] = true;
        
        // Recur for all the vertices adjacent to this vertex
        list<int>::iterator i;
        for (i = adj[v].begin(); i != adj[v].end(); ++i)
            if (!visited[*i])
                DFSUtil(*i, visited);
    }

    // Method to check if all non-zero degree vertices are connected.
    // It mainly does DFS traversal starting from
    bool isConnected()
    {
        // Mark all the vertices as not visited
        bool visited[V];
        int i;
        for (i = 0; i < V; i++)
            visited[i] = false;
        
        // Find a vertex with non-zero degree
        for (i = 0; i < V; i++)
            if (adj[i].size() != 0)
                break;
        
        // If there are no edges in the graph, return true
        if (i == V)
            return true;
        
        // Start DFS traversal from a vertex with non-zero degree
        DFSUtil(i, visited);
        
        // Check if all non-zero degree vertices are visited
        for (i = 0; i < V; i++)
            if (visited[i] == false && adj[i].size() > 0)
                return false;
        
        return true;
    }

    /* The function returns one of the following values
     0 --> If grpah is not Eulerian
     1 --> If graph has an Euler path (Semi-Eulerian)
     2 --> If graph has an Euler Circuit (Eulerian)  */
    int isEulerian()
    {
        // Check if all non-zero degree vertices are connected
        if (isConnected() == false)
            return 0;
        
        // Count vertices with odd degree
        int odd = 0;
        for (int i = 0; i < V; i++)
            if (adj[i].size() & 1)
                odd++;
        
        // If count is more than 2, then graph is not Eulerian
        if (odd > 2)
            return 0;
        
        // If odd count is 2, then semi-eulerian.
        // If odd count is 0, then eulerian
        // Note that odd count can never be 1 for undirected graph
        return (odd)? 1 : 2;
    }

    // Function to run test cases
    void test(Graph &g)
    {
        int res = g.isEulerian();
        if (res == 0)
            cout << "Graph is not Eulerian\n";
        else if (res == 1)
            cout << "Graph has a Euler path\n";
        else
            cout << "Graph has a Euler cycle\n";
    }

    string toString()
    {
        string path;
        list<int>::const_iterator iterator;
        for (iterator = adj->begin(); iterator != adj->end(); ++iterator)
        {
            stringstream ss;
            ss << *iterator;
            string node = ss.str();
            path += "," + node;
        }
        return path;
    }
};