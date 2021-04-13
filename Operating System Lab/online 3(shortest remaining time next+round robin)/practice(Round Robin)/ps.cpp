#include<bits/stdc++.h>
using namespace std;
struct process
{
    int pid,cput,arrt,priority;

};
struct gantt
{
    int id,strt,en;
    gantt(int i,int s,int e)
    {
        id=i;
        strt=s;
        en=e;
    }
};
bool cmp(process a, process b)
{
    /*if(a.priority!=b.priority)
        return a.priority<b.priority;
    else return a.pid<b.pid;*/
        return a.arrivalt<b.arrivalt;
}
int main()
{
    int n=5;
    struct process proc[n]= {{0,10,3,4},{1,6,0,5},{2,9,4,3},{3,3,6,2},{4,5,10,1}};
    vector<int> readyQ;
    sort(proc,proc+n,cmp);
    readyQ.push_back(proc[0]);
    int sum=0;
    for(int i=0;i<n;i++)
        sum+=proc[i].cput;
    int prevt=0;
    while(prevt!=sum)
    {

    }
}
