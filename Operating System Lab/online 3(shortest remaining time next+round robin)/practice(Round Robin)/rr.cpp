#include<bits/stdc++.h>
using namespace std;
struct process
{
    int pid;
    int cpuT;
    int remT;
};
struct gantt
{
    int pidg;
    int startT;
    int endT;
    gantt(int p,int s,int e)
    {
        pidg=p;
        startT=s;
        endT=e;
    }
};
struct data
{
    int starttime,endtime;
    data(int s,int e)
    {
        starttime=s;
        endtime=e;
    }
};

int main()
{
    int n=5;
    int quant;
    struct process proc[n]= {{0,0,0},{1,5,5},{2,7,7},{3,9,9},{4,9,9}};
    queue<int> q;
    q.push(1);
    q.push(2);
    q.push(3);
    q.push(4);
    cout<<"enter time quantum:"<<endl;
    cin>>quant;
    vector<gantt> gchart;
    int prevT=0;
    vector<vector<data> > vec(n);
    while(!q.empty())
    {
        int id=q.front();
        q.pop();
        int remainingT=proc[id].remT;
        if(remainingT<=quant&&remainingT!=0)
        {
            proc[id].remT=0;
            gchart.push_back(gantt(id,prevT,prevT+remainingT));
            vec[id].push_back(data(prevT,prevT+remainingT));
            prevT=prevT+remainingT;
        }
        else if(remainingT>quant)
        {
            proc[id].remT=proc[id].remT-quant;
            q.push(id);
            gchart.push_back(gantt(id,prevT,prevT+quant));
            vec[id].push_back(data(prevT,prevT+quant));
            prevT=prevT+quant;
        }

    }

    int wt[n]= {0,0,0,0,0};
    for(int i=1; i<vec.size(); i++)
    {
        cout<<"process "<<i<<":"<<endl;
        for(int j=0; j<vec[i].size(); j++)
        {
            cout<<vec[i][j].starttime<<"-"<<vec[i][j].endtime<<endl;
            if(j==0)
            {
                wt[i]+=vec[i][j].starttime;
            }
            else
            {
                wt[i]+=vec[i][j].starttime-vec[i][j-1].endtime;
            }

        }

    }
    int tat[n];
    for(int i=1; i<n; i++)
    {
        tat[i]=wt[i]+proc[i].cpuT;
        cout<<"tat"<<i<<"="<<tat[i]<<endl;
    }
    cout<<"0";
    for(int i=0; i<gchart.size(); i++)
    {
        int id,st,en;
        struct gantt gid=gchart[i];
        id=gid.pidg;
        st=gid.startT;
        en=gid.endT;
        cout<<"-------"<<en;
    }
    cout<<endl;
    for(int i=0; i<gchart.size(); i++){
        struct gantt gid=gchart[i];
        int id=gid.pidg;
        cout<<"   P"<<id;

    }

    return 0;
}
    /*cout<<"enter number of processes:"<<endl;
    cin>>n;
    struct process proc[n];
    queue<int> q;
    for(int i=0; i<n; i++)
    {
        cout<<"enter cpu time of process "<<i+1<<":"<<endl;
        cin>>proc[i].cpuT;
        proc[i].pid=i+1;
        proc[i].remT=proc[i].cpuT;
        q.push(proc[i].pid);
    }*/
