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
    vector<gantt> gchart;
    vector<vector<data> > indiData(n);
    sort(proc,proc+n,cmpArrT);
    int currentid=proc[0].pid;
    int lastArrT=proc[n-1].arrivalt;
    int sum=0;
    for(int i=0; i<n; i++)
        sum+=proc[i].cput;
    int prevt=0;
    int initT=0;
    while(prevt!=sum)
    {
        prevt++;

        proc[currentid].remt-=1;
        //sort(proc,proc+n,cmpRemT);

        if(prevt<lastArrT)
        {
            int x=proc[currentid+1].pid;
            if(proc[x].arrivalt<=prevt&&proc[x].remt<proc[currentid].remt)
            {
                gchart.push_back(gantt(currentid,initT,prevt));
                indiData[currentid].push_back(data(initT,prevt));
                currentid=x;
            }
            else continue;
        }
        else
        {
            sort(proc,proc+n,cmpRemT);
            int a=proc[0].pid;
            if(proc[currentid].remt<proc[a].remt)

        }


    }
    /*for(int i=0;i<n;i++)
        cout<<"process "<<proc[i].pid;*/

    return 0;
}
