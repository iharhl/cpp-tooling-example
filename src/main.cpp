#include <iostream>
// #include <gtest/gtest.h>

int main()
{
    int arr[5] = {1,2,3,4,5};
    arr[0] = 0;

    std::cout << arr[3] << " - " << arr[5] << "\n";

    return 0;
}