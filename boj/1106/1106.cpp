#include <iostream>
#include <vector>
#include <algorithm>
#include <climits>

using namespace std;

int solve(int C, int N, vector<int> cost, vector<int> customer)
{
	int answer = INT_MAX;
	int max_customer = *max_element(customer.begin(), customer.end());
	vector<int> dp(C + max_customer + 1, INT_MAX);

	dp[0] = 0;

	for(int i=0;i<=C;i++)
	{
		if(dp[i] == INT_MAX)
		{
			continue;
		}
		for(int j=0;j<N;j++)
		{
			int target_idx = i + customer[j];
			if(target_idx <= C + max_customer)
			{
				dp[target_idx] = min(dp[target_idx], dp[i] + cost[j]);
			}
		}
	}

	for(int i=C;i<=C+max_customer;i++)
		answer = min(answer, dp[i]);

	return answer;
}
int main()
{
	ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

	int C, N;
	cin >> C >> N;
	vector<pair<int, int>> arr(N);
	vector<int> cost(N);
	vector<int> customer(N);

	for(int i=0;i<N;i++)
		cin >> cost[i] >> customer[i];

	cout << solve(C, N, cost, customer) << endl;

	return 0;
}
