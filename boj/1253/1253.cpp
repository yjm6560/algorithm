/*
 * vim 설정
 * vim:ts=4:shiftwidth=4:et:cindent:fileencoding=utf-8:
 */

#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

int solve(int N, vector<long long>& nums)
{
    int answer = 0;

	sort(nums.begin(), nums.end());

	for (int i=0;i<N;i++)
	{
		int left = 0;
		int right = N - 1;

		while (left < right)
		{
			if (left == i || nums[i] > nums[left] + nums[right])
			{
				left++;
			}
			else if (right == i || nums[i] < nums[left] + nums[right])
			{
				right--;
			}
			else
			{
				answer++;
				break;
			}
		}
	}

    return answer;
}

int main()
{
    ios::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);

	int N;
	cin >> N;
	vector<long long> nums(N, 0);
	for (int i=0;i<N;i++)
	{
		cin >> nums[i];
	}

    int answer = solve(N, nums);

	cout << answer << "\n";

    return 0;
}
