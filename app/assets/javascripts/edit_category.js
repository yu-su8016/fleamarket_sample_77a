$(document).on('turbolinks:load', function() {

  function addOption(category) {
    let categoryOption = `<option value="${category.id}">${category.name}</option>`;
    return categoryOption;
  };

  function addChildrenSelect(insertOption) {
   let childrenSelect = `<select class="input-category__select" id="edit-children-category" name="item[category_id]">
                           <option value='---'>---</option>
                           ${insertOption}
                         </select>`;
    return childrenSelect;
  };

  function addGrandchildSelect(insertOption) {
    let grandchildSelect = `<select class="input-category__select" id="edit_grandchild_category" name="item[category_id]">
                              <option value="---" data-category="---">---</option>
                              ${insertOption}
                            </select>`;
    return grandchildSelect;
  };

  $('#edit-parent-category').on('change', function() {
    let parentCategoryId = $(this).val();
    $.ajax({
      url: '/items/category_children',
      type: 'GET',
      data: { parent_id: parentCategoryId },
      dataType: 'json'
    })
    .done(function(children) {
      let insertOption = "";
      children.forEach(function(child) {
        insertOption += addOption(child);
      });
      $('#edit-children-category').html(addChildrenSelect(insertOption));
      $('#edit-grandchild-category').html(addGrandchildSelect());
    });
  });

  $('#edit-children-category').on('change', function() {
    let childrenCategoryId = $(this).val();
    $.ajax({
      url: '/items/category_grandchildren',
      type: 'GET',
      data: { child_id: childrenCategoryId },
      dataType: 'json'
    })
    .done(function(grandChildren) {
      let insertOption = "";
      grandChildren.forEach(function(grandChild) {
        insertOption += addOption(grandChild);
      });
      $('#edit-grandchild-category').html(addGrandchildSelect(insertOption));
    });
  });
});
