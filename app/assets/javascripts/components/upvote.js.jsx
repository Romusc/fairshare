var Upvote = React.createClass({
  getInitialState: function() {
    return {
      item: this.props.item
    }
  },

  handleClick: function() {
    console.log("why hello there");
    var that = this;
    $.ajax({
      type: 'POST',
      url: Routes.upvote_item_path(this.props.item.id, { format: 'json' }),
      success: function(item) {
        console.log(item);
        that.setState({ item: item });
      }
    });
  },

  render: function() {
    var divClasses = classNames({
      "item-upvote": true,
      "item-upvote-upvoted": this.state.item.up_voted
    });

    return (
      <div className={divClasses} onClick={this.handleClick}>
        <div className="item-arrow"></div>
        <div className="item-count">
          {this.state.item.up_votes}
        </div>
      </div>
    );
  }
});
