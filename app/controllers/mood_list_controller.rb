class MoodListController < UITableViewController
  CELLID = 'face'

  def viewDidLoad
    super
    view.dataSource = view.delegate = self
    navigationItem.title = "Your Moods"
  end

  # def tableView(tableView, titleForHeaderInSection:section)
  # end

  # def sectionIndexTitlesForTableView(tableView)
  # end

  # def tableView(tableView, sectionForSectionIndexTitle:title, atIndex:index)
  # end

  def tableView(tableView, numberOfRowsInSection:section)
    1
  end

  def tableView(tableView, cellForRowAtIndexPath: indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(CELLID) || begin
      cell = UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:CELLID)
      cell.selectionStyle = UITableViewCellSelectionStyleBlue
      cell
    end

    cell.textLabel.text = "You picked a face"
    cell
  end

  def tableView(tableView, didSelectRowAtIndexPath:indexPath)
  end

  # Helper methods

  def selected_face(face)
    @face = face
  end
end
