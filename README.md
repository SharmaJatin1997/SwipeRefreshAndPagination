# SwipeRefreshAndPagiation
 
For SwipeRefresh and Pagination am using below pubdev:
# pull_to_refresh: ^2.0.0

How to Use pagination and Swipe Refresh


Example:
SmartRefresher(
            enablePullDown: true,
            enablePullUp: true,
            header: const MaterialClassicHeader(
              color: Colors.deepOrange,
            ),
            footer: const ClassicFooter(
              textStyle: TextStyle(color: Colors.black),
              loadingIcon: CupertinoActivityIndicator(
                color: Colors.deepOrange,
              ),
              loadStyle: LoadStyle.ShowWhenLoading,
            ),
            controller: _refreshController,
            scrollDirection: Axis.vertical,
            onLoading: _onLoading,
            onRefresh: _onRefresh,
            child:Container()             //return whatever you want listview/Gridview


# Before Using Smart Refresh initialize below code:
 final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
