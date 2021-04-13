#include<bits/stdc++.h>
using namespace std;
struct process
{
    int pid,arrivalt,cput,remt;
};
struct gantt
{
    int gpid,startt,endt;
    gantt(int g,int s,int e)
    {
        gpid=g;
        startt=s;
        endt=e;

    }
};
struct data
{
    int st,en;
    data(int s,int e)
    {
        st=s;
        en=e;
    }
};
bool cmpRemT(process a,process b)
{
    return a.remt<b.remt;
}
bool cmpArrT(process a,process b)
{
    return a.arrivalt<b.arrivalt;
}
int main()
{
    int n=4;
    struct process proc[4]= {{0,0,8,8},{1,1,4,4},{2,2,9,9},{3,3,5,5}};
    vector<process> readyQ;
    sort(proc,proc+n,cmpArrT);
    int val=0;
    readyQ.push_back(proc[0]);
    int sum=0;

    for(int i=0;i<n;i++)
        sum+=proc[i].cput;
    int prevt=0;
    int currentid=0;
    while(prevt<proc[n-1].arrivalt)
    {
        int nextArrT=proc[currentid+1].arrivalt-proc[currentid].arrivalt;
        prevt+=nextArrT;
        proc[currentid].remt-=nextArrT;
        readyQ.push_back(proc[currentid+1]);
        sort(readyQ,readyQ+readyQ.size(),cmpRemT);

    }
    //struct process proc2[4]= {{0,0,8,8},{1,1,4,4},{2,2,9,9},{3,3,5,5}};
    /*vector<gantt> gchart;
    vector<vector<data> > indiData(n);
    sort(proc,proc+n,cmpArrT);
    int currentID=proc[0].pid;
    while()*/


    return 0;
}
