var ItemList = React.createClass({
  render: function() {
    return (
      <div>
        {this.props.items.map(function(item){
          return <ItemListItem item={item} key={item.id} />;
        })}
      </div>
    );
  }
});
