#include<bits/stdc++.h>
using namespace std;
/*struct node
{
    char name;

};*/
int main()
{
    vector<int> adj[100];
    int ar[100];
    int nodes,edges;
    cout<<"enter no. of nodes:"<<endl;
    cin>>nodes;
    cout<<"enter name of nodes:"<<endl;
    for(int i=0; i<nodes; i++)
    {
        cin>>ar[i];
    }
    cout<<"enter no. of edges:"<<endl;
    cin>>edges;
    cout<<"Enter edges(source destination):"<<endl;
    for(int i=0;i<edges;i++)
    {
        int a,b;
        cin>>a>>b;
        adj[a].push_back(b);
    }
    for(int i=0;i<nodes;i++)
    {
        adj[0][i]=ar[i];
        cout<<adj[0][i]<<" is connected to:"<<endl;
        for(int j=0;j<adj[i].size();j++)
            cout<<adj[i][j]<<" ";
        cout<<endl;
    }

    //vector<vector<char> > adj(100)={{}
    /*vector<vector<char> > adj(100);
    char ar[100];
    int nodes,edges;
    cout<<"enter no. of nodes:"<<endl;
    cin>>nodes;
    cout<<"enter name of nodes:"<<endl;
    for(int i=0; i<nodes; i++)
    {
        cin>>ar[i];
        adj.push_back(ar[i]);
        //adj.insert(ar[i]);
        //adj.push_back(ar[i]);
        //adj[i]=ar[i];

    }
    cout<<"enter no. of edges:"<<endl;
    cin>>edges;
    cout<<"Enter edges(source destination):"<<endl;
    map<char,char> temp;
    for(int i=0;i<edges;i++)
    {
        char a,b;
        cin>>a>>b;

        //temp.
        //temp[a]=b;
        //adj[a].push_back(b);
        //cout<<"show: "<<temp[a]<<endl;
    }
    cout<<"nodes:"<<endl;
    for(int i=0;i<adj.size();i++){

        //cout<<adj[i]<<" ";
    }*/
    /*cout<<"Nodes:"<<endl;
    for(int i=0; i<n; i++)
    {
        cout<<ar[i]<<" ";

    }*/
}
