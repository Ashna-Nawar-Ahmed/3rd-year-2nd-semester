#include<bits/stdc++.h>
using namespace std;
struct process
{
    int pid,cput,remt;
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
int main()
{
    int n=5;
    struct process proc[n]= {{0,0,0},{1,5,5},{2,7,7},{3,9,9},{4,9,9}};
    int quant=3;
    int wt[n],tat[n];
    for(int i=0; i<n; i++)
    {
        wt[i]=0;
        tat[i]=0;
    }
    cout<<"here"<<endl;
    vector<gantt> gchart;
    vector<vector<data> > individualData(n);
    queue<int> q;
    q.push(1);
    q.push(2);
    q.push(3);
    q.push(4);

    int prevt=0;
    while(!q.empty())
    {
        int id=q.front();
        q.pop();
        cout<<"id="<<id<<endl;

        int val=proc[id].remt;
        cout<<"val="<<val<<endl;
        if(val<=quant&&val!=0)
        {
            proc[id].remt=0;
            gchart.push_back(gantt(id,prevt,prevt+val));
            individualData[id].push_back(data(prevt,prevt+val));
            prevt+=val;
            cout<<"prevt "<<prevt<<endl;
            cout<<"here1"<<endl;

        }
        else if(val>quant)
        {
            q.push(id);
            //q.push(2);
            proc[id].remt=proc[id].remt-quant;
            gchart.push_back(gantt(id,prevt,prevt+quant));
            individualData[id].push_back(data(prevt,prevt+quant));
            prevt+=quant;
            //q.push(id);
            cout<<"prevt "<<prevt<<endl;
            cout<<"here2"<<endl;
        }

    }
    for(int i=1; i<individualData.size(); i++)
    {
         cout<<"process "<<i<<":"<<endl;
        for(int j=0; j<individualData[i].size(); j++)
        {
            cout<<individualData[i][j].st<<"-"<<individualData[i][j].en<<endl;
            if(j==0)
            {
                wt[i]+=individualData[i][j].st;
            }
            else
            {
                wt[i]+=individualData[i][j].st-individualData[i][j-1].en;
            }
        }
    }
    for(int i=1;i<n;i++){
        tat[i]=wt[i]+proc[i].cput;
        cout<<"tat"<<i<<"="<<tat[i]<<endl;
    }
}
