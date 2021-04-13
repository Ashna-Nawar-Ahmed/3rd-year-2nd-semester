#include<bits/stdc++.h>
using namespace std;

struct process
{

    int pid;
    int cpu_time;
    int arrival_time;
    int waiting_time;
    int turnaround_time;
    int rem_cpu_time;

};

bool cmp(process a, process b)
{
    return a.arrival_time<b.arrival_time;
}


int main()
{
    int n;
    int quantum_small, quantum_large;
    int time =0;
    int total_time = 0;

    cin>>n>>quantum_small>>quantum_large;

    process temp;
    process ar[1000];

    for(int i=0; i< n; i++)
    {
        cin>>temp.pid>>temp.arrival_time>>temp.cpu_time;
        temp.rem_cpu_time = temp.cpu_time;

        total_time+=temp.cpu_time;
        ar[i] = temp;
    }

    queue<process> small_quantum_queue;
    queue<process> large_quantum_queue;
    queue<process> fcfs_queue;

    sort(ar, ar+n, cmp);

    process current;

    small_quantum_queue.push(ar[0]);
    int i=1;

    cout<<time<<"---P";

    while(!small_quantum_queue.empty() || !large_quantum_queue.empty() || !fcfs_queue.empty())
    {
        if(small_quantum_queue.empty())
        {
            if(large_quantum_queue.empty())
            {
                //work with fcfs queue
                current = fcfs_queue.front();
                fcfs_queue.pop();

                time += current.rem_cpu_time;
                cout<<current.pid<<"---"<<time;
            }
            else
            {
                //work with long quantum queue
                current = large_quantum_queue.front();
                large_quantum_queue.pop();

                if(current.rem_cpu_time>quantum_large)
                {
                    current.rem_cpu_time -= quantum_large;
                    time+=quantum_large;

                    fcfs_queue.push(current);
                    cout<<current.pid<<"---"<<time;
                    while(time>=ar[i].arrival_time && i<n)
                    {
                        small_quantum_queue.push(ar[i]);
                        i++;
                    }
                }
                else
                {
                    time += current.rem_cpu_time;
                    current.rem_cpu_time = 0;

                    cout<<current.pid<<"---"<<time;
                    while(time>=ar[i].arrival_time && i<n)
                    {
                        small_quantum_queue.push(ar[i]);
                        i++;
                    }
                }
            }

        }
        else
        {
            current = small_quantum_queue.front();
            small_quantum_queue.pop();

            if(current.rem_cpu_time>quantum_small)
            {
                current.rem_cpu_time -= quantum_small;
                time+=quantum_small;

                large_quantum_queue.push(current);
                cout<<current.pid<<"---"<<time;

                while(time>=ar[i].arrival_time && i<n)
                {
                    small_quantum_queue.push(ar[i]);
                    i++;
                }
            }
            else
            {
                time += current.rem_cpu_time;
                current.rem_cpu_time = 0;

                cout<<current.pid<<"---"<<time;
                while(time>=ar[i].arrival_time && i<n)
                {
                    small_quantum_queue.push(ar[i]);
                    i++;
                }
            }
        }
        if(time<total_time)
            cout<<"---P";

    }

    return 0;
}
