var Upvote = React.createClass({
  getInitialState: function() {
    return {
      item: this.props.item
    }
  },

  handleClick: function() {
    var that = this;
    $.ajax({
      type: 'POST',
      url: Routes.upvote_product_path(this.props.product.id, { format: 'json' }),
      success: function(data) {
        that.setState({ product: data });
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
