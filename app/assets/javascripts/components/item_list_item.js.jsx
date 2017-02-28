

var ItemListItem = React.createClass({
  render: function() {
    return (
      <div className="item">
         <div className="item-upvote">
            <Upvote item={this.props.item} />
         </div>
        <div className="item-body">
          <h3>
            <a href={this.props.item.url} target="_blank">{this.props.item.name}</a>
          </h3>
          <p>{this.props.item.description}</p>
        </div>
        <div className="item-controls">
          <div className="item-control">
            <div className="user-badge-container ">
              <img src={this.props.item.user.photo.photo.url} className="avatar"/>
            </div>
          </div>
        </div>
      </div>
    );
  }
});




