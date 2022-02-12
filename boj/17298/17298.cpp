/*
 * vim 설정
 * vim:ts=4:shiftwidth=4:et:cindent:fileencoding=utf-8:
 */

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

vector<int> solve(int n, vector<int> nums)
{
	vector<int> answer(n, -1);
	vector<int> stack;
	for(int i=0;i<nums.size();i++)
	{
		while(!stack.empty() && nums[stack.back()] < nums[i])
		{
			answer[stack.back()] = nums[i];
			stack.pop_back();
		}
		stack.push_back(i);
	}

	return answer;
}
int main()
{
	ios::sync_with_stdio(0);
	cin.tie(0);
	cout.tie(0);

	int n;
	cin >> n;
	vector<int> nums(n);
	for(int i=0;i<n;i++)
	{
		cin >> nums[i];
	}

	vector<int> result = solve(n, nums);

	for(auto val : result)
	{
		cout << val << " ";
	}
	cout << "\n";

	return 0;
}
