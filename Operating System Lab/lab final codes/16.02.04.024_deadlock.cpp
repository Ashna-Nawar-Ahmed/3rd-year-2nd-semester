#include<bits/stdc++.h>
using namespace std;
#define WHITE 0
#define GRAY 1
#define BLACK 2
int n, m;
vector<int>ar[1000];
vector<int>cycle_path;
int color[1000];
int par[1000];
bool cycle_found = false;
void DFS(int u)
{
    color[u] = GRAY;
    for (int i = 0; i < ar[u].size(); i++)
    {
        int v = ar[u][i];
        if (color[v] == GRAY)
        {
            cycle_found = true;
            int temp = u;
            cycle_path.push_back(v);
            while (temp != v)
            {
                cycle_path.push_back(temp);
                temp = par[temp];
            }
            cycle_path.push_back(0);
            return;
        }
        if (color[v] == WHITE)
        {
            par[v] = u;
            DFS(v);
        }
    }
    color[u] = BLACK;
}
int main()
{
    cout<<"Enter number of nodes and edges:"<<endl;
    cin >> n >> m;
    cout<<"Enter the edges(source destination):"<<endl;
    for (int i = 0; i < m; i++)
    {
        int a, b;
        cin >> a >> b;
        ar[a].push_back(b);
    }
    for (int i = 1; i <= n; i++)
    {
        if (color[i] == WHITE)
        {
            DFS(i);
        }
    }
    if (cycle_found)
    {
        cout << "Deadlock has been detected"<<endl;
        cout << "\nThe nodes in the cycle are:"<<endl;
        for (int i = 0; i < cycle_path.size(); i++)
        {
            if(cycle_path[i]==0)
                cout<<endl;
            else
             cout << cycle_path[i] << " ";
        }
        cout <<endl;
    }
    else
    {
        cout << "No deadlock has been detected."<<endl;
    }
    return 0;
}
